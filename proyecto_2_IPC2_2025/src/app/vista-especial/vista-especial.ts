import { Component } from '@angular/core';
import { NgIf } from '@angular/common';
import { FormsModule } from '@angular/forms';

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

}
