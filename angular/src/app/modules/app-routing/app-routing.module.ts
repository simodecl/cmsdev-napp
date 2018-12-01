import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomeComponent } from '../../components/home/home.component';
import { LoginComponent } from '../../components/login/login.component';
import { RegisterComponent } from '../../components/register/register.component';
import { ProfileSettingsComponent } from 'src/app/components/profiles/profile-settings/profile-settings.component';
import { ProfileDetailComponent } from 'src/app/components/profiles/profile-detail/profile-detail.component';
import { ProfilesComponent } from 'src/app/components/profiles/profiles.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'profiles', component: ProfilesComponent },
  { path: 'profile', component: ProfileDetailComponent },
  { path: 'profile/settings', component: ProfileSettingsComponent },

];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}
