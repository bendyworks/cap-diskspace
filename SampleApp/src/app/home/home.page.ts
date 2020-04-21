import { Component, OnInit } from '@angular/core';
import { Plugins } from '@capacitor/core';
const { Diskspace } = Plugins;

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage implements OnInit {
  private space = '?';

  constructor() {}

  async ngOnInit() {
    try {
      const { value } = await Diskspace.get();
      const { free, size } = value;
      this.space = `${this.giga(free)} / ${this.giga(size)} GB`;
      console.log(value);
    } catch (e) {
      this.space = e;
      console.log(e);
    }
  }

  giga(bytes: number): string {
    const gig = '' + (bytes / 1024 / 1024 / 1024.0);
    const [left, right] = gig.split('.');
    return `${left}.${right.substring(0, 2)}`;
  }
}
