// Learn more about Tauri commands at https://tauri.app/develop/calling-rust/
#[tauri::command]
fn add_one(number: &str) -> String {
    print!("Adding 1 to {}\n", number);
    let number: i32 = number.parse().unwrap();
    let result = number + 1;
    result.to_string()
}

#[cfg_attr(mobile, tauri::mobile_entry_point)]
pub fn run() {
    tauri::Builder::default()
        .plugin(tauri_plugin_opener::init())
        .invoke_handler(tauri::generate_handler![add_one])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
