;;; key-chord-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "key-chord" "key-chord.el" (22139 14664 448788
;;;;;;  359000))
;;; Generated autoloads from key-chord.el

(autoload 'key-chord-mode "key-chord" "\
Toggle key chord mode.
With positive ARG enable the mode. With zero or negative arg disable the mode.
A key chord is two keys that are pressed simultaneously, or one key quickly
pressed twice.
See functions `key-chord-define-global' or `key-chord-define'
and variables `key-chord-two-keys-delay' and `key-chord-one-key-delay'.

\(fn ARG)" t nil)

(autoload 'key-chord-define-global "key-chord" "\
Define a key-chord of two keys in KEYS starting a COMMAND.

KEYS can be a string or a vector of two elements. Currently only elements
that corresponds to ascii codes in the range 32 to 126 can be used.

COMMAND can be an interactive function, a string, or nil.
If COMMAND is nil, the key-chord is removed.

\(fn KEYS COMMAND)" t nil)

(autoload 'key-chord-define "key-chord" "\
Define in KEYMAP, a key-chord of two keys in KEYS starting a COMMAND.

KEYS can be a string or a vector of two elements. Currently only elements
that corresponds to ascii codes in the range 32 to 126 can be used.

COMMAND can be an interactive function, a string, or nil.
If COMMAND is nil, the key-chord is removed.

\(fn KEYMAP KEYS COMMAND)" nil nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; key-chord-autoloads.el ends here
