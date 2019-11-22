import { Component, OnInit } from '@angular/core';
import { IUserDtls } from 'src/app/Models/IUserDtls';
import { UserDetailsService } from 'src/app/Services/user-details.service';
import { Router } from '@angular/router';
import { UserService } from 'src/app/Services/user.service';

@Component({
  selector: 'app-user-registration',
  templateUrl: './user-registration.component.html',
  styleUrls: ['./user-registration.component.css']
})
export class UserRegistrationComponent implements OnInit {

  constructor(private userServ:UserDetailsService,private user:UserService, private _route:Router) { }

  existingUsers:IUserDtls[]=[
    {
      id:null,
      userPassword:null,
      username:null,
      contactNumber:null,
      regCode:null,
      regDatetime:null,
      forceResetPassword:null,
      firstName:null,
      lastName:null
    }
  ]

  newUser:IUserDtls={
    id:1000,
    userPassword:null,
    username:null,
    contactNumber:null,
    regCode:"000",
    regDatetime:new Date(),
    forceResetPassword:false,
    firstName:null,
    lastName:null
  }

  flag:number=1;

  checkIdEmailAlreadyUsed()
  {
    for(let i=0;i<this.existingUsers.length;i++)
    {
      if(this.existingUsers[i].username==this.newUser.username)
      {
        this.flag=0;
      }
    }
  }

  onSubmit()
  {
    this.userServ.registerNewUser(this.newUser).subscribe();
    this.user.notificationType="success";
    this.user.notificationMessage="User has been successfully registered";
    this._route.navigate(['']);
    
  }

  ngOnInit() {
    this.userServ.getAllUsers().subscribe((result:IUserDtls[])=>
    {
      this.existingUsers=result;
    })
  }

}
