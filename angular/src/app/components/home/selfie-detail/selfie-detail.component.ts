import { Component, OnInit } from '@angular/core';
import { Selfie } from 'src/app/models/selfie';
import { User } from 'src/app/models/user';
import { Comment } from 'src/app/models/comment';
import { PostService } from 'src/app/services/post.service';
import { AuthService } from 'src/app/services/auth.service';
import { HeaderService } from 'src/app/services/header.service';
import { ActivatedRoute, Router } from '@angular/router';
import { CommentsService } from 'src/app/services/comments.service';
import { FormBuilder, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-selfie-detail',
  templateUrl: './selfie-detail.component.html',
  styleUrls: ['./selfie-detail.component.scss']
})
export class SelfieDetailComponent implements OnInit {
  postId: number;
  currentUser: User;
  selfie: Selfie;
  comments;
  commentForm: FormGroup;
  subcommentForm: FormGroup;
  showForm = false;

  constructor(
    private postService: PostService,
    private route: ActivatedRoute,
    private router: Router,
    private authService: AuthService,
    private headerService: HeaderService,
    private commentsService: CommentsService,
    private fb: FormBuilder
  ) { }

  ngOnInit() {
    setTimeout(() => {
      this.headerService.setTitle('Selfie');
    });
    this.commentForm = this.fb.group({
      content: [''],
    });
    this.subcommentForm = this.fb.group({
      content: [''],
    });
    this.getCurrentUser();
    this.route.params.subscribe(param => {
      this.postId = param.id;
      this.getSelfie(param.id);
      this.getComments(param.id);
    });

  }
  getCurrentUser() {
    this.authService.getCurrentUser<User>().subscribe(user => {
      this.currentUser = user;
      console.log(this.currentUser);
    }, err => {
      console.error(err);
    });
  }

  getSelfie(id) {
    this.postService.getSelfieById<Selfie>(id).subscribe(res => {
      this.selfie = res;
    }, err => {
      console.error(err);
    });
  }

  deleteSelfie(id) {
    this.postService.deleteSelfie<Selfie>(id).subscribe(res => {
      this.router.navigate(['']);
    }, err => {
      console.error(err);
    });
  }

  getComments(id) {
    this.commentsService.getCommentsByPost<Comment>(id).subscribe(res => {
      this.comments = res;
    }, err => {
      console.error(err);
    });
  }

  deleteComment(id) {
    this.commentsService.deleteComment<Comment>(id).subscribe(res => {
      this.getComments(this.postId);
    }, err => {
      console.error(err);
    });
  }

  postComment() {
    const data = {
      'content': this.commentForm.value.content,
      'parent': 0,
      'post': this.postId
    };
    this.commentsService.postComment<Comment>(data).subscribe(res => {
      this.comments.shift(res);
      this.getComments(this.postId);
    }, err => {
      console.error(err);
    });
  }

  postSubcomment(parent) {
    const data = {
      'content': this.subcommentForm.value.content,
      'parent': parent,
      'post': this.postId
    };
    this.commentsService.postComment<Comment>(data).subscribe(res => {
      this.comments.shift(res);
      this.getComments(this.postId);
    }, err => {
      console.error(err);
    });
  }

  toggleLike(selfie) {
    let newLike = [];
    if (selfie.acf.likes) {
      newLike = selfie.acf.likes;
    }
    if (newLike.includes(this.currentUser.id)) {
      const i = newLike.indexOf(this.currentUser.id);
      if (i > -1) {
        newLike.splice(i, 1);
        this.selfie.acf.likes = newLike;
      }
    } else {
      newLike.push(this.currentUser.id);
      this.selfie.acf.likes = newLike;
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

  getTimeDifference(datetime) {
    datetime = typeof datetime !== 'undefined' ? datetime : '2019-01-01 01:02:03.123456';

    datetime = new Date(datetime).getTime();
    const now = new Date().getTime();

    if (isNaN(datetime)) {
      return;
    }

    let milisec_diff: number;
    if (datetime < now) {
      milisec_diff = now - datetime;
    } else {
      milisec_diff = datetime - now;
    }

    const days = Math.floor(milisec_diff / 1000 / 60 / (60 * 24));
    const date_diff = new Date(milisec_diff);
    if (days < 1) { return `${date_diff.getHours()}u`; }
    if (days >= 1) { return `${days}d`; }
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
