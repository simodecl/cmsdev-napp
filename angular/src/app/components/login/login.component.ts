import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  logoPath = '/assets/napp-logo-light.png';
  username: '';
  password: '';
  errors;
  token: null;

  constructor(
    public authService: AuthService,
    public router: Router) { }

  ngOnInit() {
    localStorage.removeItem('token');
  }
  login() {
    const data = {
      username: this.username,
      password: this.password,
    };
    // const formData = new FormData();
    // for (const key of Object.keys(data)) {
    //   formData.append(key, data[key]);
    // }
    this.authService.login(data).subscribe(result => {
      // Handle result
      console.log(result);
      localStorage.setItem('token', result.token);
      localStorage.setItem('email', result.email);
      localStorage.setItem('username', result.username);
      localStorage.setItem('displayname', result.displayname);
      this.router.navigate(['']);
    },
    error => {
      if (error.includes('Ongeldige')) {
        this.errors = 'Ongeldige gebruikersnaam';
      } else {
        this.errors = 'Ongeldig wachtwoord';
      }
      console.log(this.errors);
    },
    () => {
      // Route to new page
    });
  }
}
