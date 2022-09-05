import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  // currentValue := 300;

  stable var startTime =Time.now();
  // startTime := Time.now();
  Debug.print(debug_show(startTime));

  let id = 5489577239523759;
  // Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    let leftValue: Float = currentValue - amount;

    if(leftValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
        Debug.print("Amount is greater than currentValue")
    }
  };

  public query func checkBalance() : async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let elapsedTimeNS = currentTime - startTime;
    let elapsedTimeS = elapsedTimeNS / 86400000000000;

    currentValue := currentValue * (1.01 ** Float.fromInt(elapsedTimeS));
    startTime := currentTime;
  }

  // topUp();
}
