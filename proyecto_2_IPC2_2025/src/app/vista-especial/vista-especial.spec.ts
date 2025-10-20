import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VistaEspecial } from './vista-especial';

describe('VistaEspecial', () => {
  let component: VistaEspecial;
  let fixture: ComponentFixture<VistaEspecial>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [VistaEspecial]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VistaEspecial);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
