import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/Services/user.service';
import { NotifierService } from 'angular-notifier';

@Component({
  selector: 'app-user-login',
  templateUrl: './user-login.component.html',
  styleUrls: ['./user-login.component.css']
})
export class UserLoginComponent implements OnInit {

  constructor(private user:UserService, private notifier:NotifierService) { }

  ngOnInit() {

    if(this.user.notificationType!=null)
    {
      this.notifier.notify(this.user.notificationType,this.user.notificationMessage);
    }
    
  }



  onSubmitUser(username:string, password:string)
  {
    this.user.userLogin(username,password);
  }

  onSubmitMentor(username:string, password:string)
  {
    this.user.mentorLogin(username,password);
  }

  onSubmitAdmin(username:string, password:string)
  {
    this.user.adminLogin(username,password);
  }

}
