import { WebPlugin } from '@capacitor/core';
import { DiskspacePlugin } from './definitions';

export class DiskspaceWeb extends WebPlugin implements DiskspacePlugin {
  constructor() {
    super({
      name: 'Diskspace',
      platforms: ['web']
    });
  }

  async echo(options: { value: string }): Promise<{value: string}> {
    console.log('ECHO', options);
    return options;
  }
}

const Diskspace = new DiskspaceWeb();

export { Diskspace };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(Diskspace);
