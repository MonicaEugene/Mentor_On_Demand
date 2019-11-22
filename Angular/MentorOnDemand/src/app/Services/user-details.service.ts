import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { IUserDtls } from '../Models/IUserDtls';
import { IMentorSkillDetails } from '../Models/IMentorSkillDetails';
import { ITrainings } from '../Models/ITrainings';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class UserDetailsService {

  constructor(private http:HttpClient, private route:Router) { }

  getAllUsers():Observable<IUserDtls[]>
  {
    return this.http.get<IUserDtls[]>('https://localhost:44386/api/UserAuthentication')
  }

  authenticateUser(username:string,password:string):Observable<IUserDtls>
  {
    return this.http.get<IUserDtls>('https://localhost:44386/api/UserAuthentication/Authenticate?username='+username+'&password='+password);
  }

  GetTokenUser(username:string)
  {
    
      this.http.get('http://localhost:47565/api/'+'Jwt/GetUserToken/'+username).
      subscribe((res:any)=>{
        localStorage.setItem('token2',res.token);
        console.log(res.token);
        this.route.navigate(['UserHome']);
      })
    
  }


  registerNewUser(newUser:IUserDtls)
  {
    return this.http.post<IUserDtls>('https://localhost:44386/api/UserAuthentication', newUser);
  }

  getAllMentorSkillDeets():Observable<IMentorSkillDetails[]>
  {
    return this.http.get<IMentorSkillDetails[]>('https://localhost:44386/api/UserFunctions');
  }

  nominateTraining(newTraining:ITrainings)
  {
    return this.http.post<ITrainings>('https://localhost:44386/api/UserFunctions', newTraining);
  }

}
