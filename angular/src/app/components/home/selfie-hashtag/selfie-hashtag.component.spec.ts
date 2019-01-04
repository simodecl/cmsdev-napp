import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SelfieHashtagComponent } from './selfie-hashtag.component';

describe('SelfieHashtagComponent', () => {
  let component: SelfieHashtagComponent;
  let fixture: ComponentFixture<SelfieHashtagComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SelfieHashtagComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SelfieHashtagComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
