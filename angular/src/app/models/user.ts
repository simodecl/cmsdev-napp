export class User {
  id?: number;
  username: string;
  password: string;
  firstname: string;
  lastname: string;
  displayname: string;
  meta: Meta;
  acf: Acf;
}

export class Meta {
  avatar: string;
  school: string;
  goaldate: string;
  goalamount: string;
}

export class Acf {
  avatar: Avatar;
  school: string;
  goaldate: string;
  goalamount: string;
}

export class Avatar {
  id: number;
  url: string;
}
