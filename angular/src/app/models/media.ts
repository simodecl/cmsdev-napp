export class Media {
  id: number;
  author: number;
  media_details: MediaDetails;
}

export class MediaDetails {
  sizes: Sizes;
}

export class Sizes {
  thumbnail: Thumbnail;
}

export class Thumbnail {
  soure_url: string;
}
