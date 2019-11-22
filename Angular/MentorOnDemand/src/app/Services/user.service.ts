import { Injectable } from '@angular/core';
import { UserDetailsService } from './user-details.service';
import { IUserDtls } from '../Models/IUserDtls';
import { IMentor } from '../Models/IMentor';
import { IAdmin } from '../Models/IAdmin';
import { Router } from '@angular/router';
import { MentorService } from './mentor.service';
import { AdminService } from './admin.service';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private userServ:UserDetailsService, private _route:Router, private mentor:MentorService, private admin:AdminService) { }

  loggedInUser:IUserDtls={
    id:null,
    username:null,
    userPassword:null,
    regCode:null,
    regDatetime:null,
    firstName:null,
    lastName:null,
    contactNumber:null,
    forceResetPassword:null
  }
  loggedInMentor:IMentor={
    id:null,
    username:null,
    mentorPassword:null,
    regDatetime:null,
    regCode:null,
    firstName:null,
    lastName:null,
    yearsOfExperience:null,
    contactNumber:null,
    linkedinUrl:null,
    forceResetPassword:null
  };
  loggedInAdmin:IAdmin={
    id:null,
    username:null,
    adPassword:null
  };

  notificationType:string=null
  notificationMessage:string=null

  loggedInId:number=null;
  message:string=" ";

  userLogin(username:string, password:string)
  {
    this.userServ.authenticateUser(username,password).subscribe((result:IUserDtls)=>
    {
      this.loggedInUser=result;
      if(this.loggedInUser!=null)
      {
        this.loggedInId=result.id;
        this.message="";
        this.userServ.GetTokenUser(username);
      }
      else
      {
        this.loggedInId=null;
        this.message="Invalid Username or Password";
      }
    })
  }

  

  adminLogin(username:string, password:string)
  {
    this.admin.authenticateAdmin(username,password).subscribe((result:IAdmin)=>
    {
      this.loggedInAdmin=result;
      if(this.loggedInAdmin!=null)
      {
        this.loggedInId=result.id
        this.message="";
        this.admin.GetTokenAdmin(username);
      }
      else
      {
        this.loggedInId=null;
        this.message="Invalid username or password";
      }
    })
  }

  mentorLogin(username:string, password:string)
  {
    this.mentor.authenticateMentor(username,password).subscribe((result:IMentor)=>
    {
      this.loggedInMentor=result;
      if(this.loggedInMentor!=null)
      {
        this.loggedInId=result.id;
        this.message="";
        this.mentor.GetTokenMentor(username);
      }
      else
      {
        this.loggedInId=null;
        this.message="Invalid Username or password"
      }
    })
  }

  logout()
  {
    this.loggedInUser={
      id:null,
      username:null,
      userPassword:null,
      regCode:null,
      regDatetime:null,
      firstName:null,
      lastName:null,
      contactNumber:null,
      forceResetPassword:null
    }
    this.loggedInMentor={
      id:null,
      username:null,
      mentorPassword:null,
      regDatetime:null,
      regCode:null,
      firstName:null,
      lastName:null,
      yearsOfExperience:null,
      contactNumber:null,
      linkedinUrl:null,
      forceResetPassword:null
    };
    this.loggedInAdmin={
      id:null,
      username:null,
      adPassword:null
    };
  
    this.loggedInId=null;
    this.message=" ";
    this.notificationType=null;
    this.notificationMessage=null;
    this._route.navigate(['']);
  }

}
