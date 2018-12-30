import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment.prod';
import { Observable, throwError } from 'rxjs';
import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class TrackingService {
  errors: String;

  constructor(private http: HttpClient) { }

  public getTrackingsByUser<T>(id: number): Observable<T> {
    return this.http.get<T>(`${environment.apiURL}/tracking?author=${id}$page_limit=7`)
    .pipe(
      catchError(this.handleError)
    );
  }

  public updateTracking(data, id): Observable<any> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
      })
    };
    return this.http.post(`${environment.acfURL}/sleeptracking/${id}`, data, httpOptions)
    .pipe(
      catchError(this.handleError)
    );
  }

  public postEmptyTracking(): Observable<any> {
    return this.http.post(`${environment.apiURL}/sleeptracking`, {'status': 'publish'})
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
