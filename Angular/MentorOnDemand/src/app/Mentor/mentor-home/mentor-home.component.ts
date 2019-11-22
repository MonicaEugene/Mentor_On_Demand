import { Component, OnInit } from '@angular/core';
import { MentorService } from '../../Services/mentor.service';
import { UserService } from '../../Services/user.service';
import { IMentor } from '../../Models/IMentor';
import { ITrainingsForMentor } from 'src/app/Models/ITrainingsForMentor';
import { ISkillForMentor } from 'src/app/Models/ISkillForMentor';

@Component({
  selector: 'app-mentor-home',
  templateUrl: './mentor-home.component.html',
  styleUrls: ['./mentor-home.component.css']
})
export class MentorHomeComponent implements OnInit {

  constructor(private mentor:MentorService, private user:UserService) { }

  currentMentor:IMentor={
    id:null,
    firstName:null,
    lastName:null,
    username:null,
    mentorPassword:null,
    forceResetPassword:null,
    regCode:null,
    regDatetime:null,
    contactNumber:null,
    yearsOfExperience:null,
    linkedinUrl:null
  }

  trainings:ITrainingsForMentor[]=[
    {
      trainingId:null,
      trainingStatus:null,
      skillName:null,
      skillId:null,
      userContactNumber:null,
      userEmail:null,
      userFirstName:null,
      userLastName:null,
      duration:null
    }
  ]

  skillsForMentor:ISkillForMentor[]=[
    {
      mentorSkillId:null,
      skillId:null, 
      skillName:null,
      skillDuration:null,
      sToc:null,
      mentorSkillRating:null,
      mentorSkillRTrainingsDelivered:null,
      mentorSkillYoe:null,
      mentorSkillFacilities:null
    }
  ]

  ngOnInit() {
    this.currentMentor=this.user.loggedInMentor;
    this.mentor.getTrainingsForMentor(this.currentMentor.id).subscribe((result:ITrainingsForMentor[])=>
    {
      this.trainings=result;
    })
    this.mentor.getAllSkillsForMentor(this.currentMentor.id).subscribe((result:ISkillForMentor[])=>
    {
      this.skillsForMentor=result;
    })
  }

  logout()
  {
    this.user.logout();
  }



}
