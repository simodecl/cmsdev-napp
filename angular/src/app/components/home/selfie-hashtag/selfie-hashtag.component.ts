import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';
import { HeaderService } from 'src/app/services/header.service';
import { PostService } from 'src/app/services/post.service';
import { User } from 'src/app/models/user';
import { Selfie } from 'src/app/models/selfie';
import { FormGroup, FormBuilder } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-selfie-hashtag',
  templateUrl: './selfie-hashtag.component.html',
  styleUrls: ['./selfie-hashtag.component.scss']
})
export class SelfieHashtagComponent implements OnInit {
  currentUser: User;
  following: string;
  selfies: Selfie[];
  selectedFile: File;
  postSelfie: FormGroup;
  errors: String;

  constructor(
    private headerService: HeaderService,
    private postService: PostService,
    private authService: AuthService,
    private fb: FormBuilder,
    private route: ActivatedRoute) { }

  ngOnInit() {
    this.postSelfie = this.fb.group({
      featured_media: [],
      hashtag: [],
      title: [''],
      status: ['pending']
    });
    this.getCurrentUser();

  }
  getCurrentUser() {
    this.authService.getCurrentUser<User>().subscribe(user => {
      this.currentUser = user;
      console.log(user);
      this.route.params.subscribe(param => {
        const authors = user.acf.following.toString() + ',' + user.id.toString();
        this.getSelfies(authors, param.id.toString());
      });
    }, err => {
      console.error(err);
    });
  }

  getSelfies(following: string, hashtag: string) {
    this.postService.getSelfieByFollowingAndHashtag<Selfie[]>(following, hashtag).subscribe(selfies => {
      this.selfies = selfies;
      console.log(this.selfies);
      this.headerService.setTitle('#' + this.selfies[0]._embedded['wp:term'][0][0].name);
    }, err => {
      console.error(err);
    });
  }

  toggleLike(selfie, index) {
    let newLike = [];
    if (selfie.acf.likes) {
      newLike = selfie.acf.likes;
    }
    if (newLike.includes(this.currentUser.id)) {
      const i = newLike.indexOf(this.currentUser.id);
      if (i > -1) {
        newLike.splice(i, 1);
        this.selfies[index].acf.likes = newLike;
      }
    } else {
      newLike.push(this.currentUser.id);
      this.selfies[index].acf.likes = newLike;
    }
    const settings = {
      'fields': {
        'likes': newLike
      }
    };
    this.postService.updateSelfie(settings, selfie.id).subscribe(res => {
      console.log(res);
    }, err => {
      console.error(err);
    });
  }

  deleteSelfie(id) {
    this.postService.deleteSelfie<Selfie>(id).subscribe(res => {
      this.getCurrentUser();
    }, err => {
      console.error(err);
    });
  }

  openModal(id) {
    const modal = document.getElementById('delete' + id);
    modal.style.display = 'block';
  }

  closeModal(id) {
    const modal = document.getElementById('delete' + id);
    modal.style.display = 'none';
  }
}
