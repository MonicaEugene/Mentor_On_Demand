import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { UserLoginComponent } from './Login/user-login/user-login.component';
import { UserHomeComponent } from './USER/user-home/user-home.component';
import { UserRegistrationComponent } from './USER/user-registration/user-registration.component';
import { MentorHomeComponent } from './Mentor/mentor-home/mentor-home.component';
import { AddSkillMentorComponent } from './Mentor/add-skill-mentor/add-skill-mentor.component';
import { MentorRegisterComponent } from './Mentor/mentor-register/mentor-register.component';
import { AdminComponent } from './admin/admin.component';
import { AuthGuardService } from './Services/auth-guard.service';


const routes: Routes = [
  {
    path:'',
    component:UserLoginComponent
  },
  {
    path:'UserHome',
    component:UserHomeComponent,
    canActivate:[AuthGuardService]
  },
  {
    path:'UserRegister',
    component:UserRegistrationComponent
  },
  {
    path:'MentorHome',
    component:MentorHomeComponent,
    canActivate:[AuthGuardService]
  },
  {
    path:'MentorAddSkill',
    component:AddSkillMentorComponent,
    canActivate:[AuthGuardService]
  },
  {
    path:'MentorRegister',
    component:MentorRegisterComponent
  },
  {
    path:'Admin',
    component:AdminComponent,
    canActivate:[AuthGuardService]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
