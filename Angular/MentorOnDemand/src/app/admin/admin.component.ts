import { Component, OnInit } from '@angular/core';
import { AdminService } from '../Services/admin.service';
import { ISkill } from '../Models/ISkill';
import { UserService } from '../Services/user.service';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {

  constructor(private admin:AdminService, private user:UserService) { }

  skills:ISkill[]=[
    {
      id:null,
      sDurationHrs:null,
      sName:null,
      sToc:null,
      prerequisites:null
    }
  ]

  ngOnInit() {
    this.admin.getAllSkills().subscribe((result:ISkill[])=>{
      this.skills=result;
    })

  }

  logout()
  {
    this.user.logout();
  }

}
