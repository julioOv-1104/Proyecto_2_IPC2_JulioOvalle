import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { RegistroComponent } from './registro/registro';
import { LoginComponent } from './login/login';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, RegistroComponent, LoginComponent],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected readonly title = signal('proyecto_2_IPC2_2025');
}
