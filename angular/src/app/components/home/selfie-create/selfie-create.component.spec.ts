import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SelfieCreateComponent } from './selfie-create.component';

describe('SelfieCreateComponent', () => {
  let component: SelfieCreateComponent;
  let fixture: ComponentFixture<SelfieCreateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SelfieCreateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SelfieCreateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
