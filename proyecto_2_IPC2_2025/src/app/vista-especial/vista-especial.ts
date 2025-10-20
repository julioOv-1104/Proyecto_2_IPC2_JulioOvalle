import { Component } from '@angular/core';
import { NgIf } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';

@Component({
  selector: 'app-vista-especial',
  imports: [NgIf,FormsModule],
  templateUrl: './vista-especial.html',
  styleUrl: './vista-especial.css'
})
export class VistaEspecial {

precioPorDia: number = 75;
periodoSeleccionado: number =0;
mostrarFormularioTexto: boolean = false;
mostrarFormularioImagen: boolean = false;
mostrarFormularioVideo: boolean = false;
precioTexto: number=200;
precioImagen: number=300;
precioVideo: number = 450;
total: number = 0;
textoAnuncio: String = "";
urlAnuncio: String ="";
videoSeguro?: SafeResourceUrl; // 👈 tipo especial para iframe

  constructor(private sanitizer: DomSanitizer) {}

mostrarComprarTexto() {
  this.mostrarFormularioTexto = !this.mostrarFormularioTexto;
  this.mostrarFormularioImagen = false;
  this.mostrarFormularioVideo = false;
}
mostrarComprarImagen() {
  this.mostrarFormularioImagen = !this.mostrarFormularioImagen;
  this.mostrarFormularioTexto = false;
  this.mostrarFormularioVideo = false;
}
mostrarComprarVideo() {
  this.mostrarFormularioVideo = !this.mostrarFormularioVideo;
  this.mostrarFormularioImagen = false;
  this.mostrarFormularioTexto = false;
}

mostrarTotalCompra(){
this.total = this.precioPorDia * Number(this.periodoSeleccionado);
}

getVideoUrl() {
  if (!this.urlAnuncio) return '';

  let videoId = '';

  if (this.urlAnuncio.includes('youtube.com')) {
    // toma el texto después de "v=" y corta cualquier otro parámetro (&)
    videoId = this.urlAnuncio.split('v=')[1].split('&')[0];
  } else if (this.urlAnuncio.includes('youtu.be')) {
    // toma el último segmento del enlace
    videoId = this.urlAnuncio.split('/').pop()?.split('?')[0] || '';
  }

  const embedUrl = `https://www.youtube.com/embed/${videoId}?autoplay=1&mute=1&loop=1&playlist=${videoId}`;
  this.videoSeguro = this.sanitizer.bypassSecurityTrustResourceUrl(embedUrl);
  return this.videoSeguro;
}

}


