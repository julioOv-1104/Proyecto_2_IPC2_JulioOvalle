import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { RegistroComponent } from './registro/registro';
import { LoginComponent } from './login/login';
import { VistaEspecial } from './vista-especial/vista-especial';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, RegistroComponent, LoginComponent, VistaEspecial],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected readonly title = signal('proyecto_2_IPC2_2025');
}
