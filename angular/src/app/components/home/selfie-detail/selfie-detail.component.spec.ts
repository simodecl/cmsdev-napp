import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SelfieDetailComponent } from './selfie-detail.component';

describe('SelfieDetailComponent', () => {
  let component: SelfieDetailComponent;
  let fixture: ComponentFixture<SelfieDetailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SelfieDetailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SelfieDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
