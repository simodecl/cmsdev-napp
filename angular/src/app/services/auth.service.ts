import { catchError, tap } from 'rxjs/operators';
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Observable, of, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';
import * as jwt_decode from 'jwt-decode';
import { User } from '../models/user';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  public errors: string = null;
  constructor(
    private http: HttpClient
    ) {}

  public login(data): Observable<any> {
    return this.http.post(environment.tokenURL, data)
    .pipe(
      catchError(this.handleError) // then handle the error
    );
  }

  public register(data): Observable<any> {
    return this.http.post(`${environment.apiURL}/users/register`, data)
    .pipe(
      catchError(this.handleError) // then handle the error
    );
  }

  public getCurrentUser<T>(): Observable<T> {
    return this.http.get<T>(`${environment.apiURL}/users/me`)
    .pipe(
      catchError(this.handleError) // then handle the error
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

  getToken(): string {
    const token = localStorage.getItem('token');
    return token;
  }

  getDecodedToken(): any {
    const token = localStorage.getItem('token');
    return jwt_decode(token);
  }

  public isAuthenticated(): boolean {

    const token = localStorage.getItem('token');

    if (token) {
      return true;
    } else {
      return false;
    }
  }
}
