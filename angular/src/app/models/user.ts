export class User {
  id?: number;
  username: string;
  password: string;
  name: string;
  slug: string;
  acf: Acf;
}

export class Acf {
  avatar: Avatar;
  school: string;
  goaldate: string;
  goalamount: string;
  following: Array<number>;
  sleeptype: String;
}

export class Avatar {
  id: number;
  url: string;
}
