import { Postingan } from './postingan.model';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-linimasa',
  templateUrl: './linimasa.page.html',
  styleUrls: ['./linimasa.page.scss'],
})
export class LinimasaPage implements OnInit {
  linimasa: Postingan[] = [
    {
      id: 'post01',
      judul: 'Berikut tips saat mudik',
      imageUrl: 'https://www.wartapilihan.com/wp-content/uploads/2017/06/TIRTO-antarafoto-arus-mudik-jalur-puncak-040716-ysw-1.jpg'
    },
    {
      id: 'post02',
      judul: 'Berikut daftar nomor telepon darurat yang dapat dihubungi',
      imageUrl: 'https://i.ytimg.com/vi/r1850S590QU/maxresdefault.jpg'
    }
  ];
  constructor() { }

  ngOnInit() {
  }

}
