package pkg

import (
	"fmt"
	"io"
	"log"
	"os"
	"path"
	"time"

	"github.com/cloudwego/hertz/pkg/common/hlog"
	hertzslog "github.com/hertz-contrib/logger/slog"
	"gopkg.in/natefinch/lumberjack.v2"
)

func NewLogger() (*hertzslog.Logger, error) {
	// initialize log
	var logFilePath string
	logFilePath = "./logs/"
	if err := os.MkdirAll(logFilePath, 0o777); err != nil {
		log.Println(err.Error())
		return nil, err
	}

	// Set filename to date
	logFileName := fmt.Sprintf("%s.log", time.Now().Format("2006-01-02"))
	fileName := path.Join(logFilePath, logFileName)

	logger := hertzslog.NewLogger()
	// Provides compression and deletion
	lumberjackLogger := &lumberjack.Logger{
		Filename:   fileName,
		MaxSize:    20,   // A file can be up to 20M.
		MaxBackups: 5,    // Save up to 5 files at the same time
		MaxAge:     10,   // A file can be saved for up to 10 days.
		Compress:   true, // Compress with gzip.
	}

	// Create a multi-writer to output to both file (via lumberjack) and stdout
	multiWriter := io.MultiWriter(lumberjackLogger, os.Stdout)
	logger.SetOutput(multiWriter)
	logger.SetLevel(hlog.LevelDebug)

	return logger, nil
}
