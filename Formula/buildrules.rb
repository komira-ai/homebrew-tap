class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.60/buildrules-cli-0.0.60-macos-arm64.tar.gz"
      sha256 "d85f63a05daed9c508e3d099084d70a4bcc1f669ec1c05476f439cf14b017ac6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.60/buildrules-cli-0.0.60-linux-aarch64.tar.gz"
      sha256 "76f3d20fb7c22f448743b77ecdde195c61230bc5add624e7607339c95339c565"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.60/buildrules-cli-0.0.60-linux-x86_64.tar.gz"
      sha256 "efae5a25a8bb677c49b9fdc9d7551e22158c83763df9df6b12cea9cca103555c"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
