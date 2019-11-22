import { Component, OnInit } from '@angular/core';
import { MentorService } from 'src/app/Services/mentor.service';
import { ISkill } from 'src/app/Models/ISkill';
import { ISkillForMentor } from 'src/app/Models/ISkillForMentor';
import { IMentorSkills } from 'src/app/Models/IMentorSkills';
import { Router } from '@angular/router';
import { UserService } from 'src/app/Services/user.service';

@Component({
  selector: 'app-add-skill-mentor',
  templateUrl: './add-skill-mentor.component.html',
  styleUrls: ['./add-skill-mentor.component.css']
})
export class AddSkillMentorComponent implements OnInit {

  constructor(private mentor:MentorService, private _route:Router, private user:UserService) { }

  availableSkills:ISkill[]=[{
    id:null,
    sDurationHrs:null,
    sName:null,
    sToc:null,
    prerequisites:null
  }]


  newSkillMentor:IMentorSkills={
    id:1000,
    mId:null,
    sId:null,
    selfRating:null,
    facilitiesOffered:null,
    trainingsDelivered:null,
    yearsOfExp:null
  }


  flag:number;
  sk:number=0;

  ngOnInit() {
    this.mentor.getAvailableSkills(this.user.loggedInMentor.id).subscribe((result:ISkill[])=>
      {
        this.availableSkills=result;
      })


    
  }

  onSubmit()
  {
    this.newSkillMentor.sId=this.sk;
    this.newSkillMentor.mId=this.user.loggedInMentor.id;

    this.mentor.postNewSkill(this.newSkillMentor).subscribe(()=>
    {
      this._route.navigate(['MentorHome']);
    });
  }

  logout()
  {
    this.user.logout();
  }

}
