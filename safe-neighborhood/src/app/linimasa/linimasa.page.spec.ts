import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LinimasaPage } from './linimasa.page';

describe('LinimasaPage', () => {
  let component: LinimasaPage;
  let fixture: ComponentFixture<LinimasaPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LinimasaPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LinimasaPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
