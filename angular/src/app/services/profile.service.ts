import { AuthService } from './auth.service';
import { catchError, tap } from 'rxjs/operators';
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Observable, of, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';


@Injectable({
  providedIn: 'root'
})
export class ProfileService {
  errors = null;

  constructor(private http: HttpClient) { }

  public getCurrentUser<T>(): Observable<T> {
    const token = localStorage.getItem('token');
    const httpOptions = {
      headers: new HttpHeaders({
        'Authorization': `Bearer ${token}`
      })
    };

    return this.http.get<T>(`${environment.apiURL}/users/me`, httpOptions)
    .pipe(
      catchError(this.handleError) // then handle the error
    );
  }

  public getUsers<T>(): Observable<T> {
    return this.http.get<T>(`${environment.apiURL}/users`, )
    .pipe(
      catchError(this.handleError) // then handle the error
    );
  }
  public getUserById<T>(id: string): Observable<T> {
    return this.http.get<T>(`${environment.apiURL}/users/${id}`, )
    .pipe(
      catchError(this.handleError) // then handle the error
    );
  }

  public uploadFile(data): Observable<any> {
    const token = localStorage.getItem('token');
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Disposition': 'attachment; filename=profile.png',
        'Authorization': `Bearer ${token}`
      })
    };

    return this.http.post(`${environment.apiURL}/media`, data, httpOptions)
    .pipe(
      catchError(this.handleError) // then handle the error
    );
  }

  public updateSettings(data): Observable<any> {
    const token = localStorage.getItem('token');
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
      })
    };
    return this.http.post(`${environment.apiURL}/users/me`, data, httpOptions)
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
}
