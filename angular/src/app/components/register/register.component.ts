import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';
import { Router } from '@angular/router';
import { ProfileService } from 'src/app/services/profile.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { forEach } from '@angular/router/src/utils/collection';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {

  logoPath = '/assets/napp-logo-blue.png';
  registerForm: FormGroup;
  errors: string;
  token: null;

  constructor(
    public authService: AuthService,
    public router: Router,
    private fb: FormBuilder) { }

  ngOnInit() {
    localStorage.removeItem('token');
    this.registerForm = this.fb.group({
      username: [null, Validators.required],
      firstname: [null, Validators.required],
      lastname: [null, Validators.required],
      email: [null, Validators.required],
      password: [null, Validators.required],
      password2: [null, Validators.required]
    });
  }
  register() {
    const data = {
      username: this.registerForm.value.username,
      firstname: this.registerForm.value.firstname,
      lastname: this.registerForm.value.lastname,
      email: this.registerForm.value.email,
      password: this.registerForm.value.password,
    };
    const formData = new FormData();
    Object.keys(data).forEach(key => formData.append(key, data[key]));

    if (this.registerForm.valid) {
      if (this.registerForm.value.password === this.registerForm.value.password2) {
        console.log(formData);
        this.authService.register(formData).subscribe(result => {
          // Handle result
          console.log(result);
          this.router.navigate(['login']);
        },
        error => {
          this.errors = error;
          console.log(this.errors);
        });
      } else {
        this.errors = 'De wachtwoorden komen niet overeen';
        console.log(this.errors);
      }
    } else {
      this.errors = 'Je moet alle velden invullen';
      console.log(this.errors);
    }

  }
}
