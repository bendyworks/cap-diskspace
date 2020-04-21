declare module "@capacitor/core" {
  interface PluginRegistry {
    Diskspace: DiskspacePlugin;
  }
}

export interface DiskspacePlugin {
  echo(options: { value: string }): Promise<{value: string}>;
}
