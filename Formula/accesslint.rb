class Accesslint < Formula
  desc "Static accessibility analysis for iOS/Swift apps"
  homepage "https://github.com/SyncTek-LLC/AccessLint"
  version "1.3.1"
  license "MIT"

  on_macos do
    url "https://github.com/SyncTek-LLC/AccessLint-Distribution/releases/download/v#{version}/accesslint-#{version}.artifactbundle.zip"
    sha256 "dd33b21efe1f72da20814022a8f91d243d83081da71c64728cc9b4348f06801d"
  end

  def install
    bundle_dir = "accesslint-#{version}-macos"
    if File.exist?("#{bundle_dir}/bin/accesslint")
      bin.install "#{bundle_dir}/bin/accesslint"
    elsif File.exist?("accesslint")
      bin.install "accesslint"
    else
      # Fallback: find the binary wherever it is in the extracted archive
      binary = Dir.glob("**/accesslint").find { |f| File.executable?(f) && !File.directory?(f) }
      bin.install binary if binary
    end
  end

  test do
    assert_match "AccessLint", shell_output("#{bin}/accesslint --version")
  end
end
