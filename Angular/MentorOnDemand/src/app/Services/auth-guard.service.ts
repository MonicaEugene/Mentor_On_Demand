import { Injectable } from '@angular/core';
import { Router, ActivatedRouteSnapshot } from '@angular/router';
import { UserService } from './user.service';
import { collectExternalReferences } from '@angular/compiler';

@Injectable({
  providedIn: 'root'
})
export class AuthGuardService {
  isLoggedIn = false;

  constructor(private route: Router, private user: UserService) { }

  canActivate(route: ActivatedRouteSnapshot): boolean {
    if (this.user.loggedInId != null) {
      this.isLoggedIn = true;
    }
    if (this.isLoggedIn) {
      return true;
    }
    else {
      this.route.navigate(['/']);
      return false;
    }
  }
}
