class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.148/mopm-0.0.148-macos-arm64.tar.gz"
      sha256 "d7e9c5958808a01bb029d84861552347d3092b164bf0599a30b5318296a58b03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.148/mopm-0.0.148-linux-aarch64.tar.gz"
      sha256 "50a84aa1339e5a2aae5fe1d145c7c64988e5ed2feaa53d3e13785dc4ca4bf150"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.148/mopm-0.0.148-linux-x86_64.tar.gz"
      sha256 "2e361040ec4edc6030a58803ea35bb73b2957bc9b25cc9cc0914e025730dd203"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
