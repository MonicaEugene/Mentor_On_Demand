import { Component, OnInit } from '@angular/core';
import { IMentor } from 'src/app/Models/IMentor';
import { MentorService } from 'src/app/Services/mentor.service';
import { Router } from '@angular/router';
import { UserService } from 'src/app/Services/user.service';

@Component({
  selector: 'app-mentor-register',
  templateUrl: './mentor-register.component.html',
  styleUrls: ['./mentor-register.component.css']
})
export class MentorRegisterComponent implements OnInit {

  constructor(private mentor:MentorService, private _route:Router, private user:UserService) { }

  newMentor:IMentor={
    id:10,
    firstName:null,
    forceResetPassword:false,
    lastName:null,
    linkedinUrl:null,
    contactNumber:null,
    regCode:'000',
    regDatetime:new Date(),
    username:null,
    mentorPassword:null,
    yearsOfExperience:null
  }

  existingMentors:IMentor[]=[
    {
      id:null,
      firstName:null,
      forceResetPassword:null,
      lastName:null,
      linkedinUrl:null,
      contactNumber:null,
      regCode:null,
      regDatetime:null,
      username:null,
      mentorPassword:null,
      yearsOfExperience:null
    }
  ]

  ngOnInit() {
    this.mentor.getAllMentors().subscribe((result:IMentor[])=>
    {
      this.existingMentors=result;
    })
  }

  onSubmit()
  {
    console.log(this.newMentor);
    this.mentor.registerNewMentor(this.newMentor).subscribe();
    this.user.notificationMessage="User has been successfully registered";
    this.user.notificationType="success";
    this._route.navigate(['']);
  }

}
