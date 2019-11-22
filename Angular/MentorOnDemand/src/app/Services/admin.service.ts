import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { IAdmin } from '../Models/IAdmin';
import { Observable } from 'rxjs';
import { ISkill } from '../Models/ISkill';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AdminService {

  constructor(private http:HttpClient, private route:Router) { }

  authenticateAdmin(username:string, password:string):Observable<IAdmin>
  {
    return this.http.get<IAdmin>('https://localhost:44386/api/Admin/Authenticate?username='+username+'&password='+password);
  }

  GetTokenAdmin(username:string)
  {
      this.http.get('http://localhost:47565/api/'+'Jwt/GetAdminToken/'+username).
      subscribe((res:any)=>{
        localStorage.setItem('token1',res.token);
        console.log(res.token);
        this.route.navigate(['Admin']);
      })
  }


  getAllSkills():Observable<ISkill[]>
  {
    return this.http.get<ISkill[]>('https://localhost:44386/api/Admin');
  }

}
