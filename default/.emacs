(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)
(require 'evil)
(evil-mode t)
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Assuming you wish to install "iedit" and "magit"
(ensure-package-installed 'evil 
                          'evil-space
                          'evil-leader
                          'ample-theme
                          'helm
                          'helm-projectile
                          'helm-ls-git
                          'neotree
                          'evil-tabs
                          'magit)

(require 'helm-config)
(require 'helm)
; (global-set-key (kbd "M-x") 'helm-M-x)
; (require 'helm-projectile)
; (projectile-mode t)
; (helm-projectile-on)
(require 'helm-ls-git)
(global-set-key (kbd "C-x C-d") 'helm-browse-project)

(load-theme 'ample t t)
(enable-theme 'ample)

(require 'evil-space)
(setq evil-space-auto-setup nil)
(evil-space-mode)
(evil-space-setup "t" ";" ",")
(evil-space-setup "f" ";" ",")
(evil-space-setup "T" "," ";")
(evil-space-setup "F" "," ";")
(global-evil-tabs-mode t)

(global-set-key (kbd "C-k") (lambda () (interactive) (previous-line 10)))
(global-set-key (kbd "C-j") (lambda () (interactive) (next-line 10)))

(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "x" 'execute-extended-command
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

;; helm settings (TAB in helm window for actions over selected items,
;; C-SPC to select items)
; (helm-mode 1)
(require 'mouse)
(xterm-mouse-mode t)
(defun scroll-up-5-lines ()
  "Scroll up 5 lines"
  (interactive)
  (scroll-up 5))

(defun scroll-down-5-lines ()
  "Scroll down 5 lines"
  (interactive)
  (scroll-down 5))
(global-set-key (kbd "<mouse-4>") 'scroll-down-5-lines)
(global-set-key (kbd "<mouse-5>") 'scroll-up-5-lines)


(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
