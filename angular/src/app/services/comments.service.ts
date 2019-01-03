import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment.prod';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class CommentsService {
  errors: String;

  constructor(private http: HttpClient) { }

  public getCommentsByPost<T>(id: number): Observable<T> {
    return this.http.get<T>(`${environment.apiURL}/comments?_embed&post=${id}`)
    .pipe(
      catchError(this.handleError)
    );
  }

  public postComment<T>(data: object): Observable<T> {
    return this.http.post<T>(`${environment.apiURL}/comments`, data)
    .pipe(
      catchError(this.handleError)
    );
  }
  public deleteComment<T>(id: number): Observable<T> {
    return this.http.delete<T>(`${environment.apiURL}/comments/${id}`)
    .pipe(
      catchError(this.handleError)
    );
  }

  private handleError(errorResponse: HttpErrorResponse) {
    if (errorResponse.error instanceof ErrorEvent) {
      console.error('Client side error: ', errorResponse.error.message);
      this.errors = errorResponse.error.message;
    } else {
      console.error('Server side error: ', errorResponse);
      this.errors = errorResponse.error.message;
    }

    return throwError(this.errors);
  }
}
