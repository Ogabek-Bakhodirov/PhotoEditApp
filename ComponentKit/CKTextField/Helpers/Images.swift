//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit

public enum Images {
    case ic_apple
    case ic_eyeSlash
    case ic_google
    case im_registration_page_image
    case im_workspace_background
    case ic_user
    case ic_filter_parametr
    case ic_xMark
    case ic_plus
    case ic_shapes
    case ic_camera
    case ic_crop
    case ic_eye_slash
    case ic_trash_bin
    case ic_share
    case ic_settings
    case ic_back
    case ic_filters
    case ic_back_arrow
    case ic_forward_arrow
    case ic_forward
    case ic_squar_stack
    case ic_text
    case ic_menu_grid

    public var images: UIImage? {
        switch self {
        case .ic_apple: return UIImage(named: "ic_apple")
        case .ic_eyeSlash: return UIImage(named: "ic_eyeSlash")
        case .ic_google: return UIImage(named: "ic_google")
        case .im_registration_page_image: return UIImage(named: "RegistrationPageImage")
        case .im_workspace_background: return UIImage(named: "workspaceBackground")
        case .ic_user: return UIImage(systemName: "person")
        case .ic_filter_parametr: return UIImage(systemName: "slider.horizontal.3")
        case .ic_xMark: return UIImage(systemName: "xmark")
        case .ic_plus: return UIImage(systemName: "plus.circle")
        case .ic_shapes: return UIImage(systemName: "square.on.circle")
        case .ic_camera: return UIImage(systemName: "camera")
        case .ic_crop: return UIImage(systemName: "crop")
        case .ic_eye_slash: return UIImage(systemName: "eye.slash")
        case .ic_trash_bin: return UIImage(systemName: "trash")
        case .ic_share: return UIImage(systemName: "square.and.arrow.up")
        case .ic_settings: return UIImage(systemName: "gearshape")
        case .ic_back: return UIImage(systemName: "chevron.backward")
        case .ic_filters: return UIImage(systemName: "camera.filters")
        case .ic_back_arrow: return UIImage(systemName: "arrow.uturn.backward")
        case .ic_forward_arrow: return UIImage(systemName: "arrow.uturn.forward")
        case .ic_forward: return UIImage(systemName: "chevron.forward")
        case .ic_squar_stack: return UIImage(systemName: "square.stack.3d.up")
        case .ic_text: return UIImage(systemName: "textformat")
        case .ic_menu_grid: return UIImage(systemName: "square.grid.2x2")
        }
    }
}
