package com.bendyworks.capDiskspace;

import android.os.Environment;
import android.os.StatFs;

import com.getcapacitor.JSObject;
import com.getcapacitor.NativePlugin;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;

@NativePlugin()
public class Diskspace extends Plugin {

    @PluginMethod()
    public void get(PluginCall call) {
        StatFs stat = new StatFs(Environment.getRootDirectory().getPath());
        JSObject value = new JSObject();
        value.put("size", stat.getTotalBytes());
        value.put("free", stat.getAvailableBytes());

        JSObject ret = new JSObject();
        ret.put("value", value);
        call.success(ret);
    }
}
