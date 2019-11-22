import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { IMentor } from '../Models/IMentor';
import { ISkillForMentor } from '../Models/ISkillForMentor';
import { ISkill } from '../Models/ISkill';
import { IMentorSkills } from '../Models/IMentorSkills';
import { ITrainingsForMentor } from '../Models/ITrainingsForMentor';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class MentorService {

  constructor(private http:HttpClient, private route:Router) { }

  getAllMentors():Observable<IMentor[]>
  {
    return this.http.get<IMentor[]>('http://localhost:4778/api/MentorAuthentication');
  }

  authenticateMentor(username:string, password:string):Observable<IMentor>
  {
    return this.http.get<IMentor>('http://localhost:4778/api/MentorAuthentication/Authenticate?username='+username+'&password='+password)
  }

  GetTokenMentor(username:string)
  {
      this.http.get('http://localhost:47565/api/'+'Jwt/GetMentorToken/'+username).
      subscribe((res:any)=>{
        localStorage.setItem('token3',res.token);
        console.log(res.token);
        this.route.navigate(['MentorHome']);
      })
  }


  registerNewMentor(newMentor:IMentor)
  {
    return this.http.post<IMentor>('http://localhost:4778/api/MentorAuthentication', newMentor);
  }

  getAllSkillsForMentor(id:number):Observable<ISkillForMentor[]>
  {
    return this.http.get<ISkillForMentor[]>('http://localhost:4778/api/MentorSkill/SkillsForMentor?id='+id);    
  }

  getAvailableSkills(id:number):Observable<ISkill[]>
  {
    return this.http.get<ISkill[]>('http://localhost:4778/api/AvailableSkills/'+id);
  }

  getAllSkills():Observable<ISkill[]>
  {
    return this.http.get<ISkill[]>('http://localhost:4778/api/MentorSkill')
  }

  postNewSkill(newSkil:IMentorSkills)
  {
    return this.http.post<IMentorSkills>('http://localhost:4778/api/MentorSkill', newSkil);
  }

  getTrainingsForMentor(id:number):Observable<ITrainingsForMentor[]>
  {
    return this.http.get<ITrainingsForMentor[]>('http://localhost:4778/api/MentorFunctions/'+id);
  }

}
