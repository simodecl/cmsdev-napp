import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomeComponent } from '../../components/home/home.component';
import { LoginComponent } from '../../components/login/login.component';
import { RegisterComponent } from '../../components/register/register.component';
import { ProfileSettingsComponent } from 'src/app/components/profiles/profile-settings/profile-settings.component';
import { ProfileDetailComponent } from 'src/app/components/profiles/profile-detail/profile-detail.component';
import { ProfilesComponent } from 'src/app/components/profiles/profiles.component';
import { SelfieDetailComponent } from 'src/app/components/home/selfie-detail/selfie-detail.component';
import { SelfieCreateComponent } from 'src/app/components/home/selfie-create/selfie-create.component';
import { SelfieHashtagComponent } from 'src/app/components/home/selfie-hashtag/selfie-hashtag.component';
import { TipsComponent } from 'src/app/components/tips/tips.component';
import { QuizComponent } from 'src/app/components/quiz/quiz.component';
import { TrackingComponent } from 'src/app/components/tracking/tracking.component';
import { StatsComponent } from 'src/app/components/stats/stats.component';

import { AuthGuardService as AuthGuard } from './../../services/auth-guard.service';

const routes: Routes = [
  { path: '', component: HomeComponent, canActivate: [AuthGuard] },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent},
  { path: 'profile/:id', component: ProfileDetailComponent, canActivate: [AuthGuard] },
  { path: 'profile/:id/settings', component: ProfileSettingsComponent, canActivate: [AuthGuard] },
  { path: 'profiles', component: ProfilesComponent, canActivate: [AuthGuard] },
  { path: 'selfie/create', component: SelfieCreateComponent, canActivate: [AuthGuard] },
  { path: 'selfie/:id', component: SelfieDetailComponent, canActivate: [AuthGuard] },
  { path: 'hashtag/:id', component: SelfieHashtagComponent, canActivate: [AuthGuard] },
  { path: 'tips', component: TipsComponent, canActivate: [AuthGuard] },
  { path: 'quiz', component: QuizComponent, canActivate: [AuthGuard] },
  { path: 'tracking', component: TrackingComponent, canActivate: [AuthGuard] },
  { path: 'stats', component: StatsComponent, canActivate: [AuthGuard] },

];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}
