import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AddSkillMentorComponent } from './add-skill-mentor.component';

describe('AddSkillMentorComponent', () => {
  let component: AddSkillMentorComponent;
  let fixture: ComponentFixture<AddSkillMentorComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AddSkillMentorComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AddSkillMentorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
