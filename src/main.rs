use tuneo_ui::slint::{self, ComponentHandle};

fn main() -> Result<(), slint::PlatformError>{
    let app = tuneo_ui::MainWindow::new().expect("Cannot start window");

    app.run()
}
