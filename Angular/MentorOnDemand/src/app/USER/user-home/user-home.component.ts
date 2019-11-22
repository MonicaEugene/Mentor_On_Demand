import { Component, OnInit } from '@angular/core';
import { UserDetailsService } from 'src/app/Services/user-details.service';
import { IMentorSkillDetails } from 'src/app/Models/IMentorSkillDetails';
import { ITrainings } from 'src/app/Models/ITrainings';
import { UserService } from 'src/app/Services/user.service';

@Component({
  selector: 'app-user-home',
  templateUrl: './user-home.component.html',
  styleUrls: ['./user-home.component.css']
})
export class UserHomeComponent implements OnInit {

  searchskill:string;

  constructor(private user:UserDetailsService, private userServ:UserService) { }

  mentorSkillDeets:IMentorSkillDetails[]=[
    {
      mentorEmail:null,
      mentorFirstName:null,
      mentorId:null,
      mentorLastName:null,
      mentorLinkedInURL:null,
      mentorPhone:null,
      mentorSkillFacilitiesOffered:null,
      mentorSkillName:null,
      mentorSkillRating:null,
      mentorSkillTrainingsDelivered:null,
      mentorSkillYOE:null,
      mentorYOE:null,
      mentorSkillId:null
    }
  ]

  i:number=null;
  j:number=null;

  newTraining:ITrainings={
    id:1000,
    userid:null,
    mentorId:null,
    skillId:null,
    status:"Pending"
  }
  ngOnInit() {
    this.user.getAllMentorSkillDeets().subscribe((result:IMentorSkillDetails[])=>
    {
      this.mentorSkillDeets=result;
    })
  }

  onSubmit(skillId:number, mentorId:number)
  {
    this.newTraining.userid=this.userServ.loggedInUser.id;
    this.newTraining.skillId=skillId;
    this.newTraining.mentorId=mentorId;
    this.i=this.newTraining.mentorId;
    this.j=this.newTraining.skillId;
    this.user.nominateTraining(this.newTraining).subscribe(()=>
    {
      
    });
  }

  logout()
  {
    this.userServ.logout();
  }

 


}
