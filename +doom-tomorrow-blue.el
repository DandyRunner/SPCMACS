  (require 'doom-themes)

  (defgroup doom-tomorrow-blue-theme nil
    "Options for doom-themes"
    :group 'doom-themes)

  (defcustom doom-tomorrow-blue-brighter-modeline nil
    "If non-nil, more vivid colors will be used to style the mode-line."
    :group 'doom-tomorrow-blue-theme
    :type 'boolean)

  (defcustom doom-tomorrow-blue-brighter-comments nil
    "If non-nil, comments will be highlighted in more vivid colors."
    :group 'doom-tomorrow-blue-theme
    :type 'boolean)

  (defcustom doom-tomorrow-blue-comment-bg doom-tomorrow-blue-brighter-comments
    "If non-nil, comments will have a subtle, darker background. Enhancing their
  legibility."
    :group 'doom-tomorrow-blue-theme
    :type 'boolean)

  (defcustom doom-tomorrow-blue-padded-modeline doom-themes-padded-modeline
    "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
  determine the exact padding."
    :group 'doom-tomorrow-blue-theme
    :type '(or integer boolean))

  (def-doom-theme doom-tomorrow-blue
    "A dark theme inspired by Tomorrow Blue"

    ;; https://www.rapidtables.com/web/color/RGB_Color.html
    ;; name        default   256       16
    ((bg         '("#002451" nil       nil            )) ;;Background
     (bg-alt     '("#00346E" nil       nil            )) ;;Current Line
     (base0      '("#000D1F" "black"   "black"        ))
     (base1      '("#001738" "#1e1e1e" "brightblack"  ))
     (base2      '("#002252" "#2e2e2e" "brightblack"  )) 
     (base3      '("#002D6C" "#262626" "brightblack"  )) ;;Org headers
     (base4      '("#003785" "#3f3f3f" "brightblack"  ))
     (base5      '("#00429F" "#525252" "brightblack"  ))
     (base6      '("#004DB8" "#6b6b6b" "brightblack"  ))
     (base7      '("#0059D4" "#979797" "brightblack"  ))
     (base8      '("#0063EE" "#dfdfdf" "white"        ))
     (fg         '("#FFFFFF" "#bfbfbf" "brightwhite"  )) ;;Foreground
     (fg-alt     '("#5B6268" "#2d2d2d" "white"        ))

     (grey       base4)
     (red        '("#ff9da4" "#ff6655" "red"          )) ;;Red
     (orange     '("#da8548" "#dd8844" "brightred"    ))
     (green      '("#D1F1A9" "#99bb66" "green"        )) ;;Green
     (teal       '("#4db5bd" "#44b9b1" "brightgreen"  ))
     (yellow     '("#FFEEAD" "#ECBE7B" "yellow"       )) ;;Yellow
     (blue       '("#51afef" "#51afef" "brightblue"   ))
     (dark-blue  '("#BBDAFF" "#2257A0" "blue"         )) ;;Blue
     (magenta    '("#c678dd" "#c678dd" "brightmagenta"))
     (violet     '("#EBBBFF" "#a9a1e1" "magenta"      )) ;;Purple
     (cyan       '("#46D9FF" "#46D9FF" "brightcyan"   ))
     (dark-cyan  '("#5699AF" "#5699AF" "cyan"         ))

     ;; face categories -- required for all themes
     (highlight      blue)
     (vertical-bar   (doom-darken base1 0.1))
     (selection      dark-blue)
     (builtin        magenta)
     (comments       (if doom-tomorrow-blue-brighter-comments dark-cyan base5))
     (doc-comments   (doom-lighten (if doom-tomorrow-blue-brighter-comments dark-cyan base5) 0.25))
     (constants      violet)
     (functions      magenta)
     (keywords       blue)
     (methods        cyan)
     (operators      blue)
     (type           yellow)
     (strings        green)
     (variables      (doom-lighten magenta 0.4))
     (numbers        orange)
     (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base0) 0.35)))
     (error          red)
     (warning        yellow)
     (success        green)
     (vc-modified    orange)
     (vc-added       green)
     (vc-deleted     red)

     ;; custom categories
     (hidden     `(,(car bg) "black" "black"))
     (-modeline-bright doom-tomorrow-blue-brighter-modeline)
     (-modeline-pad
      (when doom-tomorrow-blue-padded-modeline
        (if (integerp doom-tomorrow-blue-padded-modeline) doom-tomorrow-blue-padded-modeline 4)))

     (modeline-fg     nil)
     (modeline-fg-alt base5)

     (modeline-bg
      (if -modeline-bright
          (doom-darken blue 0.475)
        `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0))))
     (modeline-bg-l
      (if -modeline-bright
          (doom-darken blue 0.45)
        `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
     (modeline-bg-inactive   `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg-alt)))
     (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


    ;; --- extra faces ------------------------
    ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

     (evil-goggles-default-face :inherit 'region :background (doom-blend region bg 0.5))

     ((line-number &override) :foreground base4)
     ((line-number-current-line &override) :foreground fg)

     (font-lock-comment-face
      :foreground comments
      :background (if doom-tomorrow-blue-comment-bg (doom-lighten bg 0.05)))
     (font-lock-doc-face
      :inherit 'font-lock-comment-face
      :foreground doc-comments)

     (mode-line
      :background modeline-bg :foreground modeline-fg
      :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
     (mode-line-inactive
      :background modeline-bg-inactive :foreground modeline-fg-alt
      :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
     (mode-line-emphasis
      :foreground (if -modeline-bright base8 highlight))

     (solaire-mode-line-face
      :inherit 'mode-line
      :background modeline-bg-l
      :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
     (solaire-mode-line-inactive-face
      :inherit 'mode-line-inactive
      :background modeline-bg-inactive-l
      :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

     ;; Doom modeline
     (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
     (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
     (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
     (doom-modeline-buffer-project-root :foreground green :weight 'bold)

     ;; ivy-mode
     (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)

     ;; --- major-mode faces -------------------
     ;; css-mode / scss-mode
     (css-proprietary-property :foreground orange)
     (css-property             :foreground green)
     (css-selector             :foreground blue)

     ;; markdown-mode
     (markdown-markup-face :foreground base5)
     (markdown-header-face :inherit 'bold :foreground red)
     (markdown-code-face :background (doom-lighten base3 0.05))

     ;; org-mode
     (org-hide :foreground hidden)
     (solaire-org-hide-face :foreground hidden))


    ;; --- extra variables ---------------------
    ;; ()
    )
