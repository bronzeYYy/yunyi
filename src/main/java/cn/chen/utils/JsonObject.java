package cn.chen.utils;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class JsonObject {
    private static final JsonParser jsonParser = new JsonParser();
    private com.google.gson.JsonObject jsonObject;
    public JsonObject() {}
    public JsonObject(String jsonString) {
        setJsonString(jsonString);
    }
    public void setJsonString(String jsonString) {
        JsonElement jsonElement = jsonParser.parse(jsonString);
        if (jsonElement.isJsonObject()) {
            jsonObject = jsonElement.getAsJsonObject();
        }
    }
    public boolean hasKey(String key) {
        return jsonObject != null && jsonObject.has(key);
    }

    public String getString(String key) {
        if (!hasKey(key)) {
            return null;
        }
        return jsonObject.get(key).toString();
    }


}
