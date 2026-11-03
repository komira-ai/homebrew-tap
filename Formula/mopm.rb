class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.105/mopm-0.0.105-macos-arm64.tar.gz"
      sha256 "c44879e7fc94b05085b4ae8bd99b6b65730156c21db740d3e0a72da6c0b90da2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.105/mopm-0.0.105-linux-aarch64.tar.gz"
      sha256 "11253469a299a583f07e90471921dd3f64e2dcf7e9c64b57e3b567a62a3d25cd"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.105/mopm-0.0.105-linux-x86_64.tar.gz"
      sha256 "fafb24334624452929d0b4a352470b2cf0c4bfadc76386513871bc42834ce7b7"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
