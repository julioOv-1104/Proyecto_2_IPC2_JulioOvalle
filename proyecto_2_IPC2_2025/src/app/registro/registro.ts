import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-registro',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './registro.html',
  styleUrl: './registro.css'
})
export class RegistroComponent {
  nombre: string = '';
  correo: string = '';
  password: string = '';

  registrar() {
    if (this.nombre && this.correo && this.password) {
      alert(`Usuario registrado: ${this.nombre}`);
      this.nombre = '';
      this.correo = '';
      this.password = '';
    } else {
      alert('Por favor completa todos los campos');
    }
  }
}